class ClientPresenter < BasePresenter
  presents :client
  delegate :id, to: :client
end
