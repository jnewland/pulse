require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Pulse" do

  before(:each) do
    @controller = PulseController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    ActionController::Routing::Routes.draw do |map|
      map.pulse 'pulse'
    end
    @successful_result_set = mock(:result_set, :num_rows => 1)
    @unsuccessful_result_set = mock(:result_set, :num_rows => 0)
    @connection = mock(:connection)
  end

  it "should recognize the pulse route" do
    params_from(:get, "/pulse").should == {:controller => "pulse", :action => "pulse"}
  end

  describe "response" do
    before(:each) do
      ActiveRecord::Base.should_receive(:connection).and_return(@connection)
    end
    
    describe "when in a healthy state" do
      before(:each) do
        @connection.should_receive(:execute).with("select 1 from dual").and_return(@successful_result_set)
      end

      it "should return a 200" do
        get 'pulse'
        @response.should be_success
      end
    end

    describe "when in an unhealthy state" do
      before(:each) do
        @connection.should_receive(:execute).with("select 1 from dual").and_return(@unsuccessful_result_set)
      end

      it "should return a 500" do
        get 'pulse'
        @response.should_not be_success
      end
    end
  end

end