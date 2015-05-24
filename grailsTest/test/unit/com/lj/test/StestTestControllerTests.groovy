package com.lj.test



import org.junit.*
import grails.test.mixin.*

@TestFor(StestTestController)
@Mock(StestTest)
class StestTestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stestTest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.stestTestInstanceList.size() == 0
        assert model.stestTestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.stestTestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.stestTestInstance != null
        assert view == '/stestTest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stestTest/show/1'
        assert controller.flash.message != null
        assert StestTest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stestTest/list'

        populateValidParams(params)
        def stestTest = new StestTest(params)

        assert stestTest.save() != null

        params.id = stestTest.id

        def model = controller.show()

        assert model.stestTestInstance == stestTest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stestTest/list'

        populateValidParams(params)
        def stestTest = new StestTest(params)

        assert stestTest.save() != null

        params.id = stestTest.id

        def model = controller.edit()

        assert model.stestTestInstance == stestTest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stestTest/list'

        response.reset()

        populateValidParams(params)
        def stestTest = new StestTest(params)

        assert stestTest.save() != null

        // test invalid parameters in update
        params.id = stestTest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stestTest/edit"
        assert model.stestTestInstance != null

        stestTest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stestTest/show/$stestTest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stestTest.clearErrors()

        populateValidParams(params)
        params.id = stestTest.id
        params.version = -1
        controller.update()

        assert view == "/stestTest/edit"
        assert model.stestTestInstance != null
        assert model.stestTestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stestTest/list'

        response.reset()

        populateValidParams(params)
        def stestTest = new StestTest(params)

        assert stestTest.save() != null
        assert StestTest.count() == 1

        params.id = stestTest.id

        controller.delete()

        assert StestTest.count() == 0
        assert StestTest.get(stestTest.id) == null
        assert response.redirectedUrl == '/stestTest/list'
    }
}
