WORDDATA = load '/user/acadgild/pig/wordcount' using TextLoader() as (line:chararray);
WORD_FT = foreach WORDDATA generate flatten(TOKENIZE(line)) as word;
WORD_GROUPED = group WORD_FT by word;
WORD_COUNT = foreach WORD_GROUPED generate group as word,COUNT(WORD_FT.word);

store WORD_COUNT into '/user/acadgild/pig/wordcount_output';
