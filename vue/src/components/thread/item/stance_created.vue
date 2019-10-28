<script lang="coffee">
import Session        from '@/shared/services/session'
import AbilityService from '@/shared/services/ability_service'
import openModal from '@/shared/helpers/open_modal'

export default
  components:
    ThreadItem: -> import('@/components/thread/item.vue')

  props:
    event: Object

  computed:
    dockActions: ->
      ['edit_stance', 'translate_stance', 'show_history']
    eventable: -> @event.model()
    choiceInHeadline: ->
      @eventable.poll().hasOptionIcons() &&
      @eventable.stanceChoices().length == 1
    canEdit: ->

    componentType:  ->
      if @event.actor()
        'router-link'
      else
        'div'
</script>

<template lang="pug">
thread-item.stance-created(:event="event" :dock-actions="dockActions")
  template(v-if="choiceInHeadline" v-slot:headline)
    component(:is="componentType" :to="event.actor() && urlFor(event.actor())") {{event.actorName()}}
    space
    poll-common-stance-choice(:stance-choice="eventable.stanceChoices()[0]")
  poll-common-stance(:stance="eventable" :reason-only="choiceInHeadline")
  attachment-list(:attachments="eventable.attachments")
</template>
