var ready = function(){

  var options = {packages: ['corechart'], callback : drawChart};
  google.load("visualization", "1", options);
  
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Number of Words', 'Words', { role: 'style' }],
      ['Scenarios Description', 500, '#61abc3'],
      ['Conduct Task Analysis', 100, '#61abc3'],
      ['User Requirements', 55, '#61abc3'],
      ['Site Requirements', 300, '#61abc3']
    ]);

    var options = {
      title: 'Number of Words',
      backgroundColor: 'transparent',
      legend: {position: 'none'}
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  };

    $('#print-document').click(function() {
      child = window.open('../document', "");
      window.focus();
      child.print();
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);