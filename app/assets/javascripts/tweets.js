// $(function(){
//   $('#start-stream').on('click', function(e){
//     e.preventDefault()
//     alert('success')
//   })
// })


$(function() {
  console.log('doc ready')

    var source = new EventSource('/stream');
    // debugger
    source.addEventListener('onmessage', function(e) {

      console.log('setting new events')
      console.log(source)
      // window.location.reload();
    });

});