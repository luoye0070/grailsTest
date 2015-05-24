package com.lj.dbc

import org.springframework.dao.DataIntegrityViolationException

import com.lj.test.OneTestSub


class OneTestSubController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view:"/dbc/OneTestSub/list",model:[oneTestSubInstanceList: OneTestSub.list(params), oneTestSubInstanceTotal: OneTestSub.count()])
    }

    def create() {
        render(view:"/dbc/OneTestSub/create",model:[oneTestSubInstance: new OneTestSub(params)])
    }

    def save() {
        def oneTestSubInstance = new OneTestSub(params)
        if (!oneTestSubInstance.save(flush: true)) {
            render(view: "/dbc/OneTestSub/create", model: [oneTestSubInstance: oneTestSubInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), oneTestSubInstance.id])
        redirect(action: "show", id: oneTestSubInstance.id)
    }

    def show(Long id) {
        def oneTestSubInstance = OneTestSub.get(id)
        if (!oneTestSubInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), id])
            redirect(action: "list")
            return
        }

        render(view:"/dbc/OneTestSub/show",model:[oneTestSubInstance: oneTestSubInstance])
    }

    def edit(Long id) {
        def oneTestSubInstance = OneTestSub.get(id)
        if (!oneTestSubInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), id])
            redirect(action: "list")
            return
        }

        render(view:"/dbc/OneTestSub/edit",model:[oneTestSubInstance: oneTestSubInstance])
    }

    def update(Long id, Long version) {
        def oneTestSubInstance = OneTestSub.get(id)
        if (!oneTestSubInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (oneTestSubInstance.version > version) {
                oneTestSubInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'oneTestSub.label', default: 'OneTestSub')] as Object[],
                          "Another user has updated this OneTestSub while you were editing")
                render(view: "/dbc/OneTestSub/edit", model: [oneTestSubInstance: oneTestSubInstance])
                return
            }
        }

        oneTestSubInstance.properties = params

        if (!oneTestSubInstance.save(flush: true)) {
            render(view: "/dbc/OneTestSub/edit", model: [oneTestSubInstance: oneTestSubInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), oneTestSubInstance.id])
        redirect(action: "show", id: oneTestSubInstance.id)
    }

    def delete(Long id) {
        def oneTestSubInstance = OneTestSub.get(id)
        if (!oneTestSubInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), id])
            redirect(action: "list")
            return
        }

        try {
            oneTestSubInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'oneTestSub.label', default: 'OneTestSub'), id])
            redirect(action: "show", id: id)
        }
    }
}
