<script lang="coffee">
import { each, flatten } from 'lodash'
import CommentService from '@/shared/services/comment_service'
import PollService from '@/shared/services/poll_service'
import StanceService from '@/shared/services/stance_service'
import ThreadService from '@/shared/services/thread_service'
import EventService from '@/shared/services/event_service'

export default
  props:
    event: Object
    model: Object
    actions: Object
    vm: Object

  computed:
    actionObjects: ->
      res = []
      Object.keys(@actions).forEach (key) ->
        switch kind
          when 'comment'
            CommentService.actions(@model)
          when 'stance'
            StanceService.actions(@model)
          when 'event'
            EventService.actions(@event)
          when 'poll'
            PollService.actions(@model)
          when 'discussion'
            ThreadService.actions(@model)


</script>

<template lang="pug">
.action-dock.lmo-no-print
  | {{actionObjects}}
  .action-dock__action.mr-1(v-for='action in actionObjects' v-if='action.canPerform()' :key="name")
    reaction-input.action-dock__button--react(:model="model" v-if="name == 'react'")
    action-button(v-if="name != 'react'" :action="action" :name="name")
</template>

<style lang="sass">
.action-dock
  display: flex
.action-dock, .action-menu
  transition: opacity ease-in-out 0.25s

.lmo-action-dock-wrapper
  .action-dock, .action-menu
    opacity: 0.5
  &:hover .action-dock, &:hover .action-menu
    opacity: 1

</style>
