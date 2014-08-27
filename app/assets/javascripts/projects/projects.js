var ready = function(){
    $('#print-document').click(function() {
      child = window.open('../document', "");
      window.focus();
      child.print();
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);