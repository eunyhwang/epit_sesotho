import re
import fasttext
    
# Training # we get a bin file as a result
print("training")
model = fasttext.train_unsupervised(corpus_tokenized, model='skipgram', epoch=25, lr=0.05, minCount=2, dim=100)
model.save_model('put_a_name')
model = fasttext.train_unsupervised(corpus_tokenized, model='cbow', epoch=25, lr=0.05, minCount=2, dim=300)
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
