{% if theme.pdf.enable %}
  {% set is_index_has_pdf = false %}

  {# At home, check if there has `pdf: true` post #}
  {% if is_home() %}
    {% for post in page.posts %}
      {% if post.pdf and not is_index_has_pdf %}
        {% set is_index_has_pdf = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

  {% if not theme.pdf.per_page or (is_index_has_pdf or page.pdf) %}
    <script src="{{ theme.pdf.pdfobject.cdn }}"></script>
    <script>
    var options = {
      pdfOpenParams: {
        navpanes: 0,
        toolbar: 0,
        statusbar: 0,
        pagemode: "thumbs",
        view: "FitV"
      },
      PDFJS_URL: "/lib/pdf/web/viewer.html",
      height: "{{ theme.pdf.height }}"
    };
    $("#main a").each(function() {
      var href = $(this).attr("href");
      if (!href) return;
      if (href.endsWith(".pdf") || href.endsWith(".pdf/")) {
        var id = "pdf" + Math.floor(Math.random() * 10000);
        $(this).after(`<div id="${id}"></div>`).remove();
        PDFObject.embed(href, "#" + id, options);
      }
    });
    </script>
    <style>
    .pdfobject-container {
      position: relative;
      overflow: auto;
      width: 100%;
      height: {{ theme.pdf.height }};
    }
    </style>
  {% endif %}
{% endif %}
