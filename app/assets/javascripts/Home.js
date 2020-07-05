class Home {
	constructor() {
		
	}
	search(params){
		$(".news").html("")
		$(".news").html('<div class="loader" id="loader"><span></span><span></span><span></span></div>')
		
		let today = new Date()
		today = today.getFullYear() + "-" + ("0" + today.getMonth()).slice(-2) + "-" + ("0" + today.getDate()).slice(-2)		
		
		let request = new Request()
		let url = 'http://newsapi.org/v2/everything?q='+params+'&from='+today+'&sortBy=popularity&language=en&apiKey=dbd8a962d3004ce993c040c8a3f23ff6'
		let successCallback = data => {
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
        let response = request.get(url,successCallback,errorCallback)
        return response
	}
}


