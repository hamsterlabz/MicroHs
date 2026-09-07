module TribeLie where

import Prelude()
import NanoPrelude

{-
Problem:

There is a tribe where all the Male members speak true statements and Female
members never speak two true statements in a row, nor two untrue statements in
a row.  (I apologize for the obvious misogyny).

A researcher comes across a mother, a father, and their child.  The mother and
father speak English but the child does not.  However, the researcher asks the
child "Are you a boy?".  The child responds but the researcher doesn't
understand the response and turns to the parents for a translation.

Parent 1: "The child said 'I am a boy.'"
Parent 2: "The child is a girl.  The child lied."

What is the sex of parent 1, parent 2, the child, and what sex did the child
say they were?

Bonus:

There is a unique solution for heterosexual, gay, and lesbian couples.  Find
all three solutions.

Solution:

Run the code :)

Approach:

Use the monadic properties of lists to setup some basic logic programming.
There are four variables in the puzzle: Sex of parent 1, Sex of parent 2, Sex
of the child, and the Sex the child said they were.  Each of these has two
possibilities, which means we've got 2^4 == 16 possible outcomes.

Using List Monads we can realize all 2^4 outcomes in a straightforward
fashion.  Then it is just a matter of testing each combination to make sure it
fits the constraints of the puzzle.  

We have two axioms:

1. A Male does not lie.
2. A Female will never tell two lies or two truths in a row.

And we have three statements (i.e. logical expressions) in the puzzle:

1. The child said a single statement, in which they declared their sex.
2. Parent 1 said a single statement: "The child said 'I am a a boy'"
3. Parent 2 said two statements: "The child is a girl.  The child lied."

Each of those three statements is realized as a function.  These functions do
not test the truth of the statement but rather test its logical validity in
the face of the axioms.  

For example, if the Child is Male then it is not possible the child said they
were Female since that would violate axiom 1.  Similarly if the Child is Female
then no matter if they lied or told the truth the statement is valid in the
face of the axioms, this is an example of the truth of statement differing
from its logical validity.

-}

-- People are either Male or Female, this represents the constraints of the puzzle.
data Sex = Male | Female

-- When creating an answer we stuff it into this data structure
data PuzzleAnswer = PuzzleAnswer Sex Sex Sex Sex Sex Sex Sex Sex
        
{-
childs_statement_is_valid(child_sex, child_described_sex)

The only combination that violates the axioms is (Male, Female) since a Male
does not lie.  Obviously (Male, Male) and (Female, *) are valid statements.
-}
childs_statement_is_valid :: Sex -> Sex -> Bool
childs_statement_is_valid Male Female = False
childs_statement_is_valid _ _ = True

{-
parent1_statement_is_valid(parent1_sex, child_described_sex)

Parent 1 said "The child said 'I am a boy'".  The only invalid combination is
(Male, Female), because that'd imply a Male (the parent) lied.  Obviously
(Male, Male) is okay because then parent 1 is telling the truth.  (Female, *)
is dubious because you can't trust a Female.
-}
parent1_statement_is_valid :: Sex -> Sex -> Bool
parent1_statement_is_valid Male Female = False
parent1_statement_is_valid _ _ = True

{-
parent2_statement_is_valid(parent1_sex, child_sex, child_described_sex)

Parent 2 said "The child is a girl.  The child lied."  If Parent 2 is Male
then the only way this can be a legal statement is if the child is Female and
said they were Male.  This would mean the child is in fact a girl and the
child did in fact lie, two statements which are both true.  This corresponds
to (Male, Female, Male) being legal.

If Parent2 is Female then (Female, *, Female) are both true.  (Female, Male,
Female) is true because the first statement is false (the child is a girl) but
the second one is true (the child lied -- it said Female when it was Male).
(Female, Female, Female) is also legal since the first statement (the child is
a girl) is true but the second one is a lie (the child lied -- the child said
they were Female and they are Female).

Any other combination will be illegal.
-}
parent2_statement_is_valid :: Sex -> Sex -> Sex -> Bool
parent2_statement_is_valid Male Female Male = True
parent2_statement_is_valid Female _ Female = True
parent2_statement_is_valid _ _ _ = False
    
allCombis = [PuzzleAnswer p1 p2 c cd c1 c2 c3 c4 | p1 <- [Male, Female],
                                       p2 <- [Male, Female],
                                       c  <- [Male, Female],
                                       cd <- [Male, Female],
                                       c1 <- [Male, Female],
                                       c2 <- [Male, Female],
                                       c3 <- [Male, Female],
                                       c4 <- [Male, Female]]
                    
predicate :: PuzzleAnswer -> Bool               
predicate (PuzzleAnswer p1 p2 c cd c1 c2 c3 c4) = 
  childs_statement_is_valid c cd && 
  parent1_statement_is_valid p1 cd && 
  parent2_statement_is_valid p2 c cd

-- challenging the stack riding scheme..    
filter' p [] = []
filter' p (x : xs) = let rest = filter' p xs in rest `seq` if p x then x : rest else rest

count p xs = sum $ map (\x -> if p x then (1::Int) else 0) xs

main = count predicate allCombis
