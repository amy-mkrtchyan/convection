# frozen_string_literal: true

class UpdateSubmissionResolver < BaseResolver
  def valid?
    return true if admin? || trusted_application?

    bad_argument_error =
      GraphQL::ExecutionError.new("Can't access updateConsignmentSubmission")
    @error = bad_argument_error
    false
  end

  def run
    submission = Submission.find_by(id: @arguments[:id])

    unless submission
      raise(GraphQL::ExecutionError, 'Submission from ID Not Found')
    end

    matching_users = submission.user&.gravity_user_id == @context[:current_user]
    unless matching_users || admin?
      raise(GraphQL::ExecutionError, 'Submission Not Found')
    end

    # I'm not clear if this is needed or not - there are no tests for it so I'm
    # suspicious that it's stale.
    #
    # params.delete('dimensions_metric')

    SubmissionService.update_submission(submission, @arguments.except(:id))

    { consignment_submission: submission }
  end
end
