<script lang="coffee">
import OutcomeService from '@/shared/services/outcome_service'
import EventService from '@/shared/services/event_service'

import { pick } from 'lodash'

export default
  components:
    ThreadItem: -> import('@/components/thread/item.vue')

  props:
    event: Object

  computed:
    eventable: -> @event.model()

</script>

<template lang="pug">
thread-item.outcome-created(:event="event")
  formatted-text.thread-item__body(:model="eventable" column="statement")
</template>
