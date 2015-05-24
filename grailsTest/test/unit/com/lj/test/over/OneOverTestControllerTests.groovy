package com.lj.test.over



import org.junit.*
import grails.test.mixin.*

@TestFor(OneOverTestController)
@Mock(OneOverTest)
class OneOverTestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/oneOverTest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.oneOverTestInstanceList.size() == 0
        assert model.oneOverTestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.oneOverTestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.oneOverTestInstance != null
        assert view == '/oneOverTest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/oneOverTest/show/1'
        assert controller.flash.message != null
        assert OneOverTest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/oneOverTest/list'

        populateValidParams(params)
        def oneOverTest = new OneOverTest(params)

        assert oneOverTest.save() != null

        params.id = oneOverTest.id

        def model = controller.show()

        assert model.oneOverTestInstance == oneOverTest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/oneOverTest/list'

        populateValidParams(params)
        def oneOverTest = new OneOverTest(params)

        assert oneOverTest.save() != null

        params.id = oneOverTest.id

        def model = controller.edit()

        assert model.oneOverTestInstance == oneOverTest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/oneOverTest/list'

        response.reset()

        populateValidParams(params)
        def oneOverTest = new OneOverTest(params)

        assert oneOverTest.save() != null

        // test invalid parameters in update
        params.id = oneOverTest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/oneOverTest/edit"
        assert model.oneOverTestInstance != null

        oneOverTest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/oneOverTest/show/$oneOverTest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        oneOverTest.clearErrors()

        populateValidParams(params)
        params.id = oneOverTest.id
        params.version = -1
        controller.update()

        assert view == "/oneOverTest/edit"
        assert model.oneOverTestInstance != null
        assert model.oneOverTestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/oneOverTest/list'

        response.reset()

        populateValidParams(params)
        def oneOverTest = new OneOverTest(params)

        assert oneOverTest.save() != null
        assert OneOverTest.count() == 1

        params.id = oneOverTest.id

        controller.delete()

        assert OneOverTest.count() == 0
        assert OneOverTest.get(oneOverTest.id) == null
        assert response.redirectedUrl == '/oneOverTest/list'
    }
}
