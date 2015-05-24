package com.lj.test.over



import org.junit.*
import grails.test.mixin.*

@TestFor(OneTestController)
@Mock(OneTest)
class OneTestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/oneTest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.oneTestInstanceList.size() == 0
        assert model.oneTestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.oneTestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.oneTestInstance != null
        assert view == '/oneTest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/oneTest/show/1'
        assert controller.flash.message != null
        assert OneTest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/oneTest/list'

        populateValidParams(params)
        def oneTest = new OneTest(params)

        assert oneTest.save() != null

        params.id = oneTest.id

        def model = controller.show()

        assert model.oneTestInstance == oneTest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/oneTest/list'

        populateValidParams(params)
        def oneTest = new OneTest(params)

        assert oneTest.save() != null

        params.id = oneTest.id

        def model = controller.edit()

        assert model.oneTestInstance == oneTest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/oneTest/list'

        response.reset()

        populateValidParams(params)
        def oneTest = new OneTest(params)

        assert oneTest.save() != null

        // test invalid parameters in update
        params.id = oneTest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/oneTest/edit"
        assert model.oneTestInstance != null

        oneTest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/oneTest/show/$oneTest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        oneTest.clearErrors()

        populateValidParams(params)
        params.id = oneTest.id
        params.version = -1
        controller.update()

        assert view == "/oneTest/edit"
        assert model.oneTestInstance != null
        assert model.oneTestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/oneTest/list'

        response.reset()

        populateValidParams(params)
        def oneTest = new OneTest(params)

        assert oneTest.save() != null
        assert OneTest.count() == 1

        params.id = oneTest.id

        controller.delete()

        assert OneTest.count() == 0
        assert OneTest.get(oneTest.id) == null
        assert response.redirectedUrl == '/oneTest/list'
    }
}
