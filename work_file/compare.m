function [ accuracy ] = compare( AnnTest )
save_eaf('test.eaf', AnnTest);
AnnTruth = load_eaf('mit_sample.eaf');
Sp = eaf_compare(AnnTruth, AnnTest, 'Window', 0.15);
accuracy = Sp.Confuse(1,1)/sum(Sp.Confuse(:));
end


