<script lang="coffee">
import AbilityService from '@/shared/services/ability_service'
import Session from '@/shared/services/session'
import LmoUrlService  from '@/shared/services/lmo_url_service'
import { compact } from 'lodash'

export default
  components:
    ThreadItem: -> import('@/components/thread/item.vue')

  props:
    event: Object

  computed:
    eventable: -> @event.model()
    link: -> LmoUrlService.event @event

    dockActions: ->
      if AbilityService.canEditComment(@eventable)
        edit_comment = 'edit_comment'
      else
        reply_to_comment = 'reply_to_comment'
        show_history = 'show_history'

      comment: ['react', reply_to_comment, edit_comment, show_history]

    menuActions: ->
      if AbilityService.canEditComment(@eventable)
        show_history = 'show_history'
        reply_to_comment = 'reply_to_comment'

      comment: compact [reply_to_comment, show_history, 'notification_history', 'translate_comment' , 'delete_comment']
      event: ['move_event', 'pin_event', 'unpin_event']

  methods:
    newComment: ->
      Records.comments.build
        bodyFormat: "html"
        body: ""
        discussionId: @eventable.discussion().id
        authorId: Session.user().id
        parentId: comment.id

  data: ->
    confirmOpts: null

</script>

<template lang="pug">
thread-item.new-comment(id="'comment-'+ eventable.id" :event="event" :menu-actions="menuActions" :dock-actions="dockActions")
  formatted-text.thread-item__body.new-comment__body(:model="eventable" column="body")
  document-list(:model='eventable' skip-fetch)
  attachment-list(:attachments="eventable.attachments")
  template(v-slot:append)
    comment-form(v-if="eventable.showReplyForm" :comment="newComment()" @comment-submitted="showReplyForm = false" @cancel-reply="showReplyForm = false" :autoFocus="true")
</template>
