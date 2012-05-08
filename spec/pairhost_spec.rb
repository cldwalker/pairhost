require 'spec_helper'

def ensure_config_file
  config_file = File.expand_path('~/.pairhost/config.yml')
  if File.exist?(config_file)
    puts "Pairhost config file found.  Assuming it's valid."
  else
    puts "Pairhost config file was NOT found.  Aborting."
    abort
  end
end

describe Pairhost do
  context "when a valid pairhost config is present" do
    before(:all) { ensure_config_file }

    context "when an instance has NOT been provisioned" do
      # TODO: make sure no instance_id file exists

      it "status returns an error message and failure exit code" do
        pairhost "status"
        stderr.should == "No pairhost instance found. Please create or attach to one.\n"
        process.should_not be_success
      end
    end

    context "when an instance has been provisioned" do
      # TODO: make sure the instance_id file exists;
      # provision an EC2 instance?
    end

  end
end