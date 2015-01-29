// $(function() {
// 	$("#ajaxbutton").click(function(e) {
// 		e.preventDefault();
// 		var getComment = $("#comment_body").val();
// 		var getPostId = $("#hidden_post").val();
// 		$("#comment_body").val("")
// 		$.post("/comments.json", {comment:{comment_body: getComment, post_id: getPostId}}).done(function(data) {
// 			// console.log(data)
// 			$(".comments").append("<p>" + data.comment_body + "</p>")
// 			UnobtrusiveFlash.flashOptions['timeout'] = 2000; // milliseconds
// 			UnobtrusiveFlash.showFlashMessage('You have successfully added a comment!', {type: 'notice'});
// 		})
// 	})
// });

