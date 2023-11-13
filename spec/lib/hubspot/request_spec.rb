require "spec_helper"

RSpec.describe Hubspot::Request do
  subject { described_class.call(url: url, options: options) }

  let(:url) { "https://api.hubapi.com/crm/v3/objects/contacts/search" }
  let(:token) { "000-000-00000000-0000-0000-0000-000000000000" }
  let(:body) { { filters: [{ propertyName: "email", operator: "EQ", value: "teste@teste.com" }] } }
  let(:headers) { { Authorization: "Bearer #{token}", "Content-Type": "application/json" } }
  let(:options) { { method: :post, query: nil, body: body, token: token } }

  before { WebMock.enable! }

  describe "#call!" do
    context "when success" do
      before do
        stub_request(:post, "https://api.hubapi.com/crm/v3/objects/contacts/search")
          .with(body: body, headers: headers)
          .to_return(status: 200, body: "", headers: {})
      end

      it "returns a response" do
        expect(subject).to be_success
      end

      it "returns a response with a body" do
        expect(subject.data[:response].code).to eq(200)
      end
    end

    context "when failure url" do
      let(:url) { nil }

      it "returns a failure" do
        expect(subject).to be_failure
      end

      it "returns a failure with a message" do
        expect(subject.data[:exception].message).to eq("Hubspot url is not valid")
      end
    end

    context "when failure token" do
      let(:options) { { method: :get, query: nil, token: nil } }

      it "returns a failure" do
        expect(subject).to be_failure
      end

      it "returns a failure with a message" do
        expect(subject.data[:exception].message).to eq("Hubspot token is not valid")
      end
    end

    context "when failure method" do
      let(:options) { { method: nil, query: nil, token: token } }

      it "returns a failure" do
        expect(subject).to be_failure
      end

      it "returns a failure with a message" do
        expect(subject.data[:exception].message).to eq("Hubspot method is not valid")
      end
    end
  end
end
