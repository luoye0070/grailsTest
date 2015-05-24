package lj.test

class OneTestController {

    def index() {
        String htmlStr="";
        if(request.method=="POST"){
            htmlStr=params.content;
        }
        render(view: "index",model: [htmlStr:htmlStr]);
    }
}
