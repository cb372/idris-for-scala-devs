import Data.String

data Preference = StronglyTyped | StringlyTyped

inputType : Preference -> Type
inputType StronglyTyped = Integer
inputType StringlyTyped = String

outputType : Preference -> Type
outputType StronglyTyped = Bool
outputType StringlyTyped = String

isLessThanThree : (pref : Preference) -> 
                  (inputType pref) -> 
                  (outputType pref)

isLessThanThree StronglyTyped x = x < 3

isLessThanThree StringlyTyped x = boolToString verdict where

  checkParsed : Maybe Integer -> Bool
  checkParsed (Just y) = y < 3
  checkParsed Nothing = False
  
  verdict : Bool
  verdict = x == "zero" || 
            x == "one" || 
            x == "two" || 
            pack(take 5 (unpack x)) == "minus" ||
            checkParsed (parseInteger x)

  boolToString : Bool -> String
  boolToString False = "false"
  boolToString True  = "true"
  
