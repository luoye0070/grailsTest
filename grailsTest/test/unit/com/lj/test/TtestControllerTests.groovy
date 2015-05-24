package com.lj.test



import org.junit.*
import grails.test.mixin.*

@TestFor(TtestController)
@Mock(Ttest)
class TtestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ttest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ttestInstanceList.size() == 0
        assert model.ttestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ttestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ttestInstance != null
        assert view == '/ttest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ttest/show/1'
        assert controller.flash.message != null
        assert Ttest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ttest/list'

        populateValidParams(params)
        def ttest = new Ttest(params)

        assert ttest.save() != null

        params.id = ttest.id

        def model = controller.show()

        assert model.ttestInstance == ttest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ttest/list'

        populateValidParams(params)
        def ttest = new Ttest(params)

        assert ttest.save() != null

        params.id = ttest.id

        def model = controller.edit()

        assert model.ttestInstance == ttest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ttest/list'

        response.reset()

        populateValidParams(params)
        def ttest = new Ttest(params)

        assert ttest.save() != null

        // test invalid parameters in update
        params.id = ttest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ttest/edit"
        assert model.ttestInstance != null

        ttest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ttest/show/$ttest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ttest.clearErrors()

        populateValidParams(params)
        params.id = ttest.id
        params.version = -1
        controller.update()

        assert view == "/ttest/edit"
        assert model.ttestInstance != null
        assert model.ttestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ttest/list'

        response.reset()

        populateValidParams(params)
        def ttest = new Ttest(params)

        assert ttest.save() != null
        assert Ttest.count() == 1

        params.id = ttest.id

        controller.delete()

        assert Ttest.count() == 0
        assert Ttest.get(ttest.id) == null
        assert response.redirectedUrl == '/ttest/list'
    }
}
