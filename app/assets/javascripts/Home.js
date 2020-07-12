class Home {
	constructor(base_url) {
		this.base_url = base_url;
	}

	loaded(){
		$(".AboutFeresNews").hide()
		$("#myFrame").hide()
	}

	search(params){
		$(".categories-mobile").html("")
		$(".news").html("")
		$(".news").html('<div class="loader" id="loader"><span></span><span></span><span></span></div>')
		let today = new Date()
		today = today.getFullYear() + "-" + ("0" + today.getMonth()).slice(-2) + "-" + ("0" + today.getDate()).slice(-2)		
		let request = new Request()
		let url = this.base_url + "/search"
		let data = { date: today, search_param: params }
		let successCallback = data => {
			console.log(data)
			$(".news").html("")
			$(".news").append("<h4 class='ml-3 mr-3 mb-4'>Showing results for "+params+"</h4>" +
						"<div class='articles'>" +
							"<center>" +
								"<div class='row row-news'>" +
								"</div>" +
							"</center>" +
						"</div>"
			)
			for (var i = 0; i < data.articles.length; i++) {
				console.log(data.articles[i].title)
				let html =	"<div class='col-lg-3 col-md-4 col-sm-12 mb-3'>" +
								"<div class='article'>" +
									"<div>" +
										"<a target='blank' href="+data.articles[i].url+">" +
											"<img class='thumb' src="+data.articles[i].urlToImage+" />" +
											"<p class='title'>"+data.articles[i].title+"</p>" +
										"</a>" +
									"</div>" +
									"<div>" +
										"<a target='blank' href="+data.articles[i].url+">" +
											"<button class='read'> Read </button>"
										"</a>" +
									"</div>" +
								"</div>" +
							"</div>" +
				$(".row-news").append(html)		
			}
		}
        let errorCallback = (jqXHR, textStatus, msg) => { 
            console.log(msg)
            $(".news").html("")
            $(".news").html("<p>Erro</p>")
        }
        let response = request.post(data,url,successCallback,errorCallback)
        return response
	}
	displayNews(newsUrl){
		$("#newsFrame").attr("src", newsUrl)
		$("#myFrame").show()
		$("#myFrame").addClass("animated slideInUp")
		setTimeout(function(){
			$("#myFrame").addClass("myFrameBlurredBackground")
			$("#myFrame").removeClass("animated slideInUp")
		},750)		
	}
	closeNews(){
		$("#myFrame").removeClass("myFrameBlurredBackground")
		$("#myFrame").addClass("animated slideOutDown")
		setTimeout(function(){
			$("#myFrame").hide()
			$("#myFrame").removeClass("animated slideOutDown")
			$("#newsFrame").attr("src", "")
		},750)
	}
}


