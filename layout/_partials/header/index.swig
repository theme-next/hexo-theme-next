{{ partial('_partials/header/brand.swig', {}, {cache: theme.cache.enable}) }}

{{ partial('_partials/header/menu.swig', {}, {cache: theme.cache.enable}) }}

{{ partial('_partials/search/index.swig', {}, {cache: theme.cache.enable}) }}

{{- next_inject('header') }}
