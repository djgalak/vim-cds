if exists("b:current_syntax")
	finish
endif

syntax match cdsComment "\v\/\/.*$"
syntax region cdsComment start="\v/\*" end="\v\*/"

" Can't gather enough tuits yet to complete this class
syntax match cdsOtherstuff /=/
syntax match cdsAnnotation /\v\@\a*/

syntax match supportClassCds /\v(<|>)(Association to (one|many|)|Composition of (one|many|)|Boolean|Date|Time|DateTime|Timestamp|Number|Integer|Decimal|String)(<|>)/
syntax match keywordStrongCds /\v(<|>)(key|as|on|namespace|import|using|define|extend|annotate|expose|context|service|abstract|entity|view|type|facet|annotation|actions|action|function)(<|>)/
syntax match keywordStrongControlCds /\v(<|>)from(<|>)/
syntax region stringQuotedSingleCds start="\v'" end="\v'"
syntax region stringQuotedDoubleCds start="\v\"" end="\v\""

highlight link keywordStrongCds        Keyword
highlight link keywordStrongControlCds Keyword
highlight link cdsOtherstuff           Keyword
highlight link cdsComment              Comment
highlight link stringQuotedSingleCds   String
highlight link stringQuotedDoubleCds   String
highlight link supportClassCds         Constant
highlight link cdsAnnotation           Function

let b:current_syntax = "cds"
