#import pandas as pd
#import numpy as np
import re
import fasttext
from spacy.lang.af import Afrikaans

nlp = Afrikaans()

with open('/home/hwange/sesotho_corpus.txt', 'r', encoding ='UTF8') as file:
    corpus = file.readlines()
    tokens_updated = []
    for sent in corpus:
        sent = re.sub(r"[^a-z0-9]+",' ', sent.lower())
        #print("sent:", sent)
        doc = nlp(sent)
        #print("doc",doc)
        tokens = [token.text for token in doc]
        #print(tokens)
        tokens_updated.extend(tokens)
    #corpus_tokenzied = ' '.join(tokens_updated)
    #print(corpus_tokenzied)
    #print(tokens_updated)

with open('corpus_preprocessed.txt','w') as f_output:
    corpus_tokenized = ' '.join(tokens_updated)
    f_output.write(corpus_tokenized)


model = fasttext.train_unsupervised('corpus_preprocessed.txt', model='skipgram', epoch=25, lr=0.1, minCount=1, dim=300)
model.save_model('/scratch/hwange/fastText/result/tokenized_skipgram_lr=0.1')
print("training finished")


print("neighborhood test")
model.get_nearest_neighbors('ntate')
model.get_nearest_neighbors('afrika')
model.get_nearest_neighbors('apole')

print("analogy test")
model.get_analogies('berlin','germany','france')
model.get_analogies('morena','motho','mosadi')
model.get_analogies('iphone','apple','samsung')

'''
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


with open('corpus_tokenized.txt','w') as output:
    output.write(corpus_tokenized)
    output.close()

'''

#tokens=[]
#for line in corpus:
#    line_tokenized = nlp(line)
#    tokens = [token.text for token in line_tokenized]
