<script>
(function() {
  // Initialization
  var calendar = {
    orderBy     : 'startTime',
    showLocation: 'false',
    offsetMax   : 72,
    offsetMin   : 4,
    showDeleted : 'false',
    singleEvents: 'true',
    maxResults  : '250'
  }

  // Read config form theme config file
  Object.assign(calendar, {{ theme.calendar | json_encode }});

  var now = new Date();
  var timeMax = new Date();
  var timeMin = new Date();

  timeMax.setHours(now.getHours() + calendar.offsetMax);
  timeMin.setHours(now.getHours() - calendar.offsetMin);
  calendar.timeMaxISO      = timeMax.toISOString();
  calendar.timeMinISO      = timeMin.toISOString();

  // Build URL
  const BASE_URL           = 'https://www.googleapis.com/calendar/v3/calendars/';
  const FIELD_KEY          = 'key';
  const FIELD_ORDERBY      = 'orderBy';
  const FIELD_TIMEMAX      = 'timeMax';
  const FIELD_TIMEMIN      = 'timeMin';
  const FIELD_SHOWDELETED  = 'showDeleted';
  const FIELD_SINGLEEVENTS = 'singleEvents';
  const FIELD_MAXRESULTS   = 'maxResults';

  var request_url = BASE_URL + calendar.calendar_id  + '/events?' +
    FIELD_KEY          + '=' + calendar.api_key      + '&' +
    FIELD_ORDERBY      + '=' + calendar.orderBy      + '&' +
    FIELD_TIMEMAX      + '=' + calendar.timeMaxISO   + '&' +
    FIELD_TIMEMIN      + '=' + calendar.timeMinISO   + '&' +
    FIELD_SHOWDELETED  + '=' + calendar.showDeleted  + '&' +
    FIELD_SINGLEEVENTS + '=' + calendar.singleEvents + '&' +
    FIELD_MAXRESULTS   + '=' + calendar.maxResults;

  fetchData();
  var queryLoop = setInterval(fetchData, 60000);

  function fetchData() {
    var eventList = document.getElementById('event-list');
    if (!eventList) return;

    fetch(request_url).then(response => {
      return response.json();
    }).then(data => {
      // Clean the event list
      eventList.innerHTML = '';
      var prevEnd = 0; // used to decide where to insert an <hr>

      data.items.forEach(event => {
        // Parse data
        var utc   = new Date().getTimezoneOffset() * 60000;
        var start = event.start.dateTime = new Date(event.start.dateTime || (new Date(event.start.date).getTime() + utc));
        var end   = event.end.dateTime = new Date(event.end.dateTime || (new Date(event.end.date).getTime() + utc));

        tense = judgeTense(now, start, end); // 0:now 1:future -1:past

        if (tense == 1 && prevEnd < now) {
          eventList.innerHTML += '<hr>';
        }

        eventDOM = buildEventDOM(tense, event);
        eventList.innerHTML += eventDOM;

        prevEnd = end;
      });
    });
  }

  function getRelativeTime(current, previous) {
    var msPerMinute = 60 * 1000;
    var msPerHour = msPerMinute * 60;
    var msPerDay = msPerHour * 24;
    var msPerMonth = msPerDay * 30;
    var msPerYear = msPerDay * 365;

    var elapsed = current - previous;
    var tense = elapsed > 0 ? 'ago' : 'later';

    elapsed = Math.abs(elapsed);

    if      ( elapsed < msPerHour  ) {
      return Math.round(elapsed/msPerMinute) + ' minutes ' + tense;
    }
    else if ( elapsed < msPerDay   ) {
      return Math.round(elapsed/msPerHour) + ' hours ' + tense;
    }
    else if ( elapsed < msPerMonth ) {
      return 'about ' + Math.round(elapsed/msPerDay) + ' days ' + tense;
    }
    else if ( elapsed < msPerYear  ) {
      return 'about ' + Math.round(elapsed/msPerMonth) + ' months ' + tense;
    }
    else {
      return 'about' + Math.round(elapsed/msPerYear) + ' years' + tense;
    }
  }

  function judgeTense(now, eventStart, eventEnd) {
    if      (eventEnd   < now) { return -1; }
    else if (eventStart > now) { return  1; }
    else                       { return  0; }
  }

  function buildEventDOM(tense, event) {
    var tenseClass = '';
    var start      = event.start.dateTime;
    var end        = event.end.dateTime;
    switch(tense) {
      case 0 : // now
        tenseClass = 'event-now';
        break;
      case 1 : // future
        tenseClass = 'event-future';
        break;
      case -1: // past
        tenseClass = 'event-past';
        break;
      default:
        throw 'Time data error';
    }
    durationFormat = {
      weekday: 'short',
      hour   : '2-digit',
      minute : '2-digit'
    };
    relativeTimeStr = (tense == 0) ? 'NOW' : getRelativeTime(now, start);
    durationStr = start.toLocaleTimeString([], durationFormat) + ' - ' +
                  end.toLocaleTimeString([], durationFormat);

    liOpen  = '<li class="event ' + tenseClass + '">';
    liClose = '</li>';
    h2Open  = '<h2 class="event-summary">';
    h2Close = '</h2>';

    locationDOM     = '';
    if (calendar.showLocation && event.location) {
      locationDOM   = '<span class="event-location event-details">' + event.location + '</span>';
    }
    relativeTimeDOM = '<span class="event-relative-time">' + relativeTimeStr + '</span>';
    durationDOM     = '<span class="event-duration event-details">' + durationStr + '</span>';

    eventContent =
      liOpen +
        h2Open +
          event.summary +
          relativeTimeDOM+
        h2Close +
        locationDOM +
        durationDOM +
      liClose;
    return eventContent;
  }
})();
</script>
