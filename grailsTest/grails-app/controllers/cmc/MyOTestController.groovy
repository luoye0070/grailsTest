package cmc

import com.lj.test.SecondTest

class MyOTestController {

    def index() {

        SecondTest secondTest=SecondTest.first();

        render(view:"/desktop/hello",model: [secondTest:secondTest]);
    }
}
