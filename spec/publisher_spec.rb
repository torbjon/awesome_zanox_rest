require 'spec_helper'

describe AwesomeZanox::Publisher do
  before do
    @client = AwesomeZanox::Client.new('someId', 'someSecret')
  end

  describe 'Profiles' do
    it 'should return profiles' do
      stub_get('profiles').to_return(with_fixture('publisher_profiles.json'))
      expect(@client.publisher.profiles['profileItem'][0]['firstName']).to eq('Maksim')
    end
  end

  describe 'AdSpaces' do
    it 'should return adspaces' do
      stub_get('adspaces').to_return(with_fixture('publisher_adspaces.json'))
      expect(@client.publisher.adspaces(items: 20, page: 2)['page']).to eq(0)
    end

    it 'should return adspace 1' do
      stub_get('adspaces/adspace/1').to_return(with_fixture('publisher_adspace.json'))
      expect(@client.publisher.adspace(1)['adspaceItem'][0]['name']).to eq('berjoza')
    end
  end

  describe 'AdMedia' do
    it 'should return admedias' do
      stub_get('admedia').to_return(with_fixture('publisher_admedias.json'))
      expect(@client.publisher.admedia(items: 20, page: 2)['page']).to eq(0)
    end
  end

  describe 'Programs' do
    it 'should return programs' do
      stub_get('programs').to_return(with_fixture('publisher_programs.json'))
      expect(@client.publisher.programs['programItems']['programItem'][0]['@id']).to eq('12078')
    end

    it 'should return program 1' do
      stub_get('programs/program/1').to_return(with_fixture('publisher_program.json'))
      expect(@client.publisher.program(1)['programItem'][0]['@id']).to eq('10320')
    end
  end

  describe 'ProgramApplications' do
    it 'should return programapplications' do
      stub_get('programapplications').to_return(with_fixture('publisher_programapplications.json'))
      expect(@client.publisher.programapplications(items: 20, page: 2)['page']).to eq(0)
    end
  end
end
