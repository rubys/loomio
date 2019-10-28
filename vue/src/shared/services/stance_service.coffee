import openModal from '@/shared/helpers/open_modal'
import AbilityService from '@/shared/services/ability_service'
import Records from '@/shared/services/records'
import Session from '@/shared/services/session'

export default new class StanceService
  actions: (stance) ->
    edit_stance:
      name: 'poll_common.change_vote'
      icon: 'mdi-pencil'
      canPerform: ->
        stance.latest && stance.poll().isActive() && stance.participant() == Session.user()
      perform: ->
        openModal
          component: 'PollCommonEditVoteModal',
          props:
            stance: stance.clone()

    translate_stance:
      icon: 'mdi-translate'
      name: 'common.action.translate'
      canPerform: ->
        stance.reason && AbilityService.canTranslate(stance)
      perform: ->
        stance.translate(Session.user().locale)

    show_history:
      name: 'action_dock.edited'
      icon: 'mdi-history'
      canPerform: -> stance.edited()
      perform: ->
        openModal
          component: 'RevisionHistoryModal'
          props:
            model: stance
