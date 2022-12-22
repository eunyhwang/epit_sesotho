from fasttext import load_model
import argparse

language_model = load_model("/put_the_path_of_your_model") 

words = language_model.get_words()
with open("/home/hwange/fastText/cbow_300.vec","w") as file_out: #open a VEC file to write down
    #the first line contan number of total words and vector dimension
    file_out.write(str(len(words)) + " " + str(language_model.get_dimension()) + "\n")
    print("it's going well")
    #line by line, append vectors to VEC file
    for word in words:
        vector = language_model.get_word_vector(word)
        vector_str = ""
        for i in vector:
            vector_str += " " +str(i)
        try:
            file_out.write(word + vector_str+"\n")
        except:
            pass
