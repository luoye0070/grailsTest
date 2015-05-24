package com.lj.test



import org.junit.*
import grails.test.mixin.*

@TestFor(SecondTestController)
@Mock(SecondTest)
class SecondTestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/secondTest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.secondTestInstanceList.size() == 0
        assert model.secondTestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.secondTestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.secondTestInstance != null
        assert view == '/secondTest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/secondTest/show/1'
        assert controller.flash.message != null
        assert SecondTest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/secondTest/list'

        populateValidParams(params)
        def secondTest = new SecondTest(params)

        assert secondTest.save() != null

        params.id = secondTest.id

        def model = controller.show()

        assert model.secondTestInstance == secondTest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/secondTest/list'

        populateValidParams(params)
        def secondTest = new SecondTest(params)

        assert secondTest.save() != null

        params.id = secondTest.id

        def model = controller.edit()

        assert model.secondTestInstance == secondTest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/secondTest/list'

        response.reset()

        populateValidParams(params)
        def secondTest = new SecondTest(params)

        assert secondTest.save() != null

        // test invalid parameters in update
        params.id = secondTest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/secondTest/edit"
        assert model.secondTestInstance != null

        secondTest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/secondTest/show/$secondTest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        secondTest.clearErrors()

        populateValidParams(params)
        params.id = secondTest.id
        params.version = -1
        controller.update()

        assert view == "/secondTest/edit"
        assert model.secondTestInstance != null
        assert model.secondTestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/secondTest/list'

        response.reset()

        populateValidParams(params)
        def secondTest = new SecondTest(params)

        assert secondTest.save() != null
        assert SecondTest.count() == 1

        params.id = secondTest.id

        controller.delete()

        assert SecondTest.count() == 0
        assert SecondTest.get(secondTest.id) == null
        assert response.redirectedUrl == '/secondTest/list'
    }
}
