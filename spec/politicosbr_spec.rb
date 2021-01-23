require 'spec_helper'

describe PoliticosBR do
  
    it 'has a version number' do
        expect(PoliticosBR::VERSION).not_to be nil
    end

    it 'has a DEPUTADOS_URL constant' do
        expect(PoliticosBR::DEPUTADOS_URL).not_to be nil
    end

    it 'has a SENADORES_URL constant' do
        expect(PoliticosBR::SENADORES_URL).not_to be nil
    end

end