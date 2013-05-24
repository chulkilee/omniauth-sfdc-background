# encoding: utf-8
require 'spec_helper'

describe OmniAuth::Strategies::SfdcBackground do
  describe '#request_phase', focus: true do
    it 'should display a form'

    context 'with valid credentials' do
      it 'should populate the auth hash'
    end
  end

  describe '#callback_phase' do
    context 'with valid credentials' do
      it 'should populate the auth hash'
      it 'should populate the uid'
      it 'should populate the info hash'
    end

    context 'with invalid credentials' do
      it 'should fail with :invalid_credentials'
    end
  end
end
