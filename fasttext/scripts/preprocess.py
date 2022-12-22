import re
import fasttext
from spacy.lang.af import Afrikaans

nlp = Afrikaans()

print("preprocessing")
with open('/home/hwange/sesotho_corpus.txt', 'r', encoding ='UTF8') as file:
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

print("training")
model = fasttext.train_unsupervised(corpus_tokenized, model='skipgram', epoch=25, lr=0.05, minCount=2, dim=100)
print(model)

print("neighborhood test")
output= model.get_nearest_neighbors('ntate')
print(output)
