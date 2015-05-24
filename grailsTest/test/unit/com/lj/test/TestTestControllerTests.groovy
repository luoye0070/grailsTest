package com.lj.test



import org.junit.*
import grails.test.mixin.*

@TestFor(TestTestController)
@Mock(TestTest)
class TestTestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/testTest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.testTestInstanceList.size() == 0
        assert model.testTestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.testTestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.testTestInstance != null
        assert view == '/testTest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/testTest/show/1'
        assert controller.flash.message != null
        assert TestTest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/testTest/list'

        populateValidParams(params)
        def testTest = new TestTest(params)

        assert testTest.save() != null

        params.id = testTest.id

        def model = controller.show()

        assert model.testTestInstance == testTest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/testTest/list'

        populateValidParams(params)
        def testTest = new TestTest(params)

        assert testTest.save() != null

        params.id = testTest.id

        def model = controller.edit()

        assert model.testTestInstance == testTest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/testTest/list'

        response.reset()

        populateValidParams(params)
        def testTest = new TestTest(params)

        assert testTest.save() != null

        // test invalid parameters in update
        params.id = testTest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/testTest/edit"
        assert model.testTestInstance != null

        testTest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/testTest/show/$testTest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        testTest.clearErrors()

        populateValidParams(params)
        params.id = testTest.id
        params.version = -1
        controller.update()

        assert view == "/testTest/edit"
        assert model.testTestInstance != null
        assert model.testTestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/testTest/list'

        response.reset()

        populateValidParams(params)
        def testTest = new TestTest(params)

        assert testTest.save() != null
        assert TestTest.count() == 1

        params.id = testTest.id

        controller.delete()

        assert TestTest.count() == 0
        assert TestTest.get(testTest.id) == null
        assert response.redirectedUrl == '/testTest/list'
    }
}
