package com.lj.test



import org.junit.*
import grails.test.mixin.*

@TestFor(OneTestSubController)
@Mock(OneTestSub)
class OneTestSubControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/oneTestSub/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.oneTestSubInstanceList.size() == 0
        assert model.oneTestSubInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.oneTestSubInstance != null
    }

    void testSave() {
        controller.save()

        assert model.oneTestSubInstance != null
        assert view == '/oneTestSub/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/oneTestSub/show/1'
        assert controller.flash.message != null
        assert OneTestSub.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/oneTestSub/list'

        populateValidParams(params)
        def oneTestSub = new OneTestSub(params)

        assert oneTestSub.save() != null

        params.id = oneTestSub.id

        def model = controller.show()

        assert model.oneTestSubInstance == oneTestSub
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/oneTestSub/list'

        populateValidParams(params)
        def oneTestSub = new OneTestSub(params)

        assert oneTestSub.save() != null

        params.id = oneTestSub.id

        def model = controller.edit()

        assert model.oneTestSubInstance == oneTestSub
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/oneTestSub/list'

        response.reset()

        populateValidParams(params)
        def oneTestSub = new OneTestSub(params)

        assert oneTestSub.save() != null

        // test invalid parameters in update
        params.id = oneTestSub.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/oneTestSub/edit"
        assert model.oneTestSubInstance != null

        oneTestSub.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/oneTestSub/show/$oneTestSub.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        oneTestSub.clearErrors()

        populateValidParams(params)
        params.id = oneTestSub.id
        params.version = -1
        controller.update()

        assert view == "/oneTestSub/edit"
        assert model.oneTestSubInstance != null
        assert model.oneTestSubInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/oneTestSub/list'

        response.reset()

        populateValidParams(params)
        def oneTestSub = new OneTestSub(params)

        assert oneTestSub.save() != null
        assert OneTestSub.count() == 1

        params.id = oneTestSub.id

        controller.delete()

        assert OneTestSub.count() == 0
        assert OneTestSub.get(oneTestSub.id) == null
        assert response.redirectedUrl == '/oneTestSub/list'
    }
}
