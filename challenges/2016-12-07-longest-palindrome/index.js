import test from 'ava'

const inputs = [
  'aba',
  'abad',
  'natan',
  'tanznaia',
  'a',
  'nnnnnnnnnnatannnnnnnnnncivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth',

]

const outputs = [
  'aba',
  'aba',
  'natan',
  'anzna',
  'a',
  'nnnnnnnnnnatannnnnnnnnn',
]

test('sum 1', t => {
    t.true(isPalindrome('natan'))
    t.false(isPalindrome('iurhaoiejapw'))
    for (var i = inputs.length - 1; i >= 0; i--) {
      t.is(getLongestPalindrome(inputs[i]), outputs[i], 'test ' + i)
    }
})

function isPalindrome (value) {

  for (var i = 0; i < value.length / 2; i++) {
    if(value[i] !== value[value.length - 1 - i]) {
      return false
    }

  }
  return true
}

function getLongestPalindrome (value) {
  var longest = ""

  for(var i = 0; i < value.length; i++) {
    for (var j = value.length; j > longest.length && j > i; j--){
        var substr = value.substring(i,j);
        if(substr.length > longest.length && isPalindrome(substr)) {
          longest = substr;
        }
    }
  }
  return longest
}
