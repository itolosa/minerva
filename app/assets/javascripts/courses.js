$(document).ready(function() {
  function formatRepo (repo) {
    if (repo.loading) return repo.text;

    var markup = "<div class='select2-result-repository clearfix'>" +
      "<div class='select2-result-repository__avatar'><img src='" +  "' /></div>" +
      "<div class='select2-result-repository__meta'>" +
        "<div class='select2-result-repository__title'>" + repo.email + "</div>";
    return markup;
  }

  function formatRepoSelection (repo) {
    return repo.email;
  }

  $(".js-data-example-ajax").select2({
    ajax: {
      url: "/users",
      dataType: 'json',
      delay: 250,
      data: function (params) {
        return {
          q: { 
            email_cont: params.term 
          }
        };
      },
      processResults: function (data, params) {
        // parse the results into the format expected by Select2
        // since we are using custom formatting functions we do not need to
        // alter the remote JSON data, except to indicate that infinite
        // scrolling can be used
        params.page = params.page || 1;

        return {
          results: data
        };
      },
      cache: true
    },
    escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
    minimumInputLength: 1,
    templateResult: formatRepo, // omitted for brevity, see the source of this page
    templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
  });
});

$(document).ready(minerva);

function minerva() {
  $('#calendar').fullCalendar({
    theme: true,
    header: {
      left: 'title',
      center: null,
      right: null
    },
    footer: {
      left: 'prev,next today',
      center: null,
      right: null
    },
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day Event',
        start: '2017-04-01'
      },
      {
        title: 'Long Event',
        start: '2017-04-07',
        end: '2017-04-10'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2017-04-09T16:00:00'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2017-04-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2017-04-11',
        end: '2017-04-13'
      },
      {
        title: 'Meeting',
        start: '2017-04-12T10:30:00',
        end: '2017-04-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2017-04-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2017-04-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2017-04-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2017-04-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2017-04-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2017-04-28'
      }
    ]
  });
  
}
