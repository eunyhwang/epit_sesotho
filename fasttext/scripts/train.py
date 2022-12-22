import re
import fasttext
from spacy.lang.af import Afrikaans

nlp = Afrikaans()

# Preprcessing

print("preprocessing")
with open('/path_to_your_corpus', 'r', encoding ='UTF8') as file:
    corpus = file.readlines()
    for sent in corpus:
        doc = nlp(sent)
        tokens = [token.text for token in doc]
        print(tokens)

    corpus = re.sub(r'\([^)]*\)', '', corpus) #remove information with brackets
    corpus = re.sub(r'([\'\"\.\(\)\!\?\-\\\/\,])', '', corpus)
    corpus = re.sub(r"[^a-z0-9]+",'', corpus.lower())
    print("tokenizing")
    corpus_tokenized = [nlp(sent) for sent in corpus]

    
# Training
print("training")
model = fasttext.train_unsupervised(corpus_tokenized, model='skipgram', epoch=25, lr=0.05, minCount=2, dim=100)
model.save_model('put_a_name')
model = fasttext.train_unsupervised(corpus_tokenized, model='cbow', epoch=25, lr=0.05, minCount=2, dim=100)
model.save_model('put_a_name')

# Evaluation
print("neighborhood test")
model.get_nearest_neighbors('ntate')
model.get_nearest_neighbors('afrika')
model.get_nearest_neighbors('apole')

print("analogy test")
model.get_analogies('berlin','germany','france')
model.get_analogies('morena','motho','mosadi')
model.get_analogies('iphone','apple','samsung')
