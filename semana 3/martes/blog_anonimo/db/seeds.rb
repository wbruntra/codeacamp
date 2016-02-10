def load_sonnets
  titles = ["Fair creatures", "Beauteous Field", "Fresh repair", "Unthrifty loveliness"]
  bodies =  [
    "I  From fairest creatures we desire increase,\n  That thereby beauty's rose might never die,\n  But as the riper should by time decease,\n  His tender heir might bear his memory:\n  But thou, contracted to thine own bright eyes,\n  Feed'st thy light's flame with self-substantial fuel,\n  Making a famine where abundance lies,\n  Thy self thy foe, to thy sweet self too cruel:\n  Thou that art now the world's fresh ornament,\n  And only herald to the gaudy spring,\n  Within thine own bud buriest thy content,\n  And tender churl mak'st waste in niggarding:\n    Pity the world, or else this glutton be,\n    To eat the world's due, by the grave and thee.",
    "II  When forty winters shall besiege thy brow,\n  And dig deep trenches in thy beauty's field,\n  Thy youth's proud livery so gazed on now,\n  Will be a tatter'd weed of small worth held:\n  Then being asked, where all thy beauty lies,\n  Where all the treasure of thy lusty days;\n  To say, within thine own deep sunken eyes,\n  Were an all-eating shame, and thriftless praise.\n  How much more praise deserv'd thy beauty's use,\n  If thou couldst answer 'This fair child of mine\n  Shall sum my count, and make my old excuse,'\n  Proving his beauty by succession thine!\n    This were to be new made when thou art old,\n    And see thy blood warm when thou feel'st it cold.",
    "III  Look in thy glass and tell the face thou viewest\n  Now is the time that face should form another;\n  Whose fresh repair if now thou not renewest,\n  Thou dost beguile the world, unbless some mother.\n  For where is she so fair whose unear'd womb\n  Disdains the tillage of thy husbandry?\n  Or who is he so fond will be the tomb,\n  Of his self-love to stop posterity?\n  Thou art thy mother's glass and she in thee\n  Calls back the lovely April of her prime;\n  So thou through windows of thine age shalt see,\n  Despite of wrinkles this thy golden time.\n    But if thou live, remember'd not to be,\n    Die single and thine image dies with thee.",
    "IV  Unthrifty loveliness, why dost thou spend\n  Upon thy self thy beauty's legacy?\n  Nature's bequest gives nothing, but doth lend,\n  And being frank she lends to those are free:\n  Then, beauteous niggard, why dost thou abuse\n  The bounteous largess given thee to give?\n  Profitless usurer, why dost thou use\n  So great a sum of sums, yet canst not live?\n  For having traffic with thy self alone,\n  Thou of thy self thy sweet self dost deceive:\n  Then how when nature calls thee to be gone,\n  What acceptable audit canst thou leave?\n    Thy unused beauty must be tombed with thee,\n Which, used, lives th' executor to be."]
  tags = [['flowers','desire','food','counting'],['seasons','beauty','desire'],['face','glass','seasons'],['counting','beauty','nature']]
  sonnets = []
  for i in 0...4
    sonnets.push({
      'author' => 'W Shakespeare',
      'title' => titles[i],
      'body' => bodies[i],
      'tags' => tags[i]
      })
  end
  return sonnets
end

sonnets = load_sonnets()

for sonnet in sonnets do
  author = sonnet['author']
  title = sonnet['title']
  body = sonnet['body']
  tags = sonnet['tags']
  add_post(title,author,body,tags)
end

def load_sonnets2
  sonnets = []
  titles = ["Lovely gaze","Ragged Hand","Gracious Light","Hear Music","Widow's Eye","Art Unprovident"]
  tags =[ ['time','flowers'],
  ['seasons','happiness','beauty'],
  ['light','beauty','time'],
  ['marriage','husbands'],
  ['music','family','songs'],
  ['shame','love','beauty']]
  bodies = [
    "V  Those hours, that with gentle work did frame\n  The lovely gaze where every eye doth dwell,\n  Will play the tyrants to the very same\n  And that unfair which fairly doth excel;\n  For never-resting time leads summer on\n  To hideous winter, and confounds him there;\n  Sap checked with frost, and lusty leaves quite gone,\n  Beauty o'er-snowed and bareness every where:\n  Then were not summer's distillation left,\n  A liquid prisoner pent in walls of glass,\n  Beauty's effect with beauty were bereft,\n  Nor it, nor no remembrance what it was:\n    But flowers distill'd, though they with winter meet,\n    Leese but their show; their substance still lives sweet.",
    "VI  Then let not winter's ragged hand deface,\n  In thee thy summer, ere thou be distill'd:\n  Make sweet some vial; treasure thou some place\n  With beauty's treasure ere it be self-kill'd.\n  That use is not forbidden usury,\n  Which happies those that pay the willing loan;\n  That's for thy self to breed another thee,\n  Or ten times happier, be it ten for one;\n  Ten times thy self were happier than thou art,\n  If ten of thine ten times refigur'd thee:\n  Then what could death do if thou shouldst depart,\n  Leaving thee living in posterity?\n    Be not self-will'd, for thou art much too fair\n    To be death's conquest and make worms thine heir.",
    "VII  Lo! in the orient when the gracious light\n  Lifts up his burning head, each under eye\n  Doth homage to his new-appearing sight,\n  Serving with looks his sacred majesty;\n  And having climb'd the steep-up heavenly hill,\n  Resembling strong youth in his middle age,\n  Yet mortal looks adore his beauty still,\n  Attending on his golden pilgrimage:\n  But when from highmost pitch, with weary car,\n  Like feeble age, he reeleth from the day,\n  The eyes, 'fore duteous, now converted are\n  From his low tract, and look another way:\n    So thou, thyself outgoing in thy noon:\n    Unlook'd, on diest unless thou get a son.",
    "VIII  Music to hear, why hear'st thou music sadly?\n  Sweets with sweets war not, joy delights in joy:\n  Why lov'st thou that which thou receiv'st not gladly,\n  Or else receiv'st with pleasure thine annoy?\n  If the true concord of well-tuned sounds,\n  By unions married, do offend thine ear,\n  They do but sweetly chide thee, who confounds\n  In singleness the parts that thou shouldst bear.\n  Mark how one string, sweet husband to another,\n  Strikes each in each by mutual ordering;\n  Resembling sire and child and happy mother,\n  Who, all in one, one pleasing note do sing:\n    Whose speechless song being many, seeming one,\n    Sings this to thee: 'Thou single wilt prove none.'",
    "IX  Is it for fear to wet a widow's eye,\n  That thou consum'st thy self in single life?\n  Ah! if thou issueless shalt hap to die,\n  The world will wail thee like a makeless wife;\n  The world will be thy widow and still weep\n  That thou no form of thee hast left behind,\n  When every private widow well may keep\n  By children's eyes, her husband's shape in mind:\n  Look! what an unthrift in the world doth spend\n  Shifts but his place, for still the world enjoys it;\n  But beauty's waste hath in the world an end,\n  And kept unused the user so destroys it.\n    No love toward others in that bosom sits\n    That on himself such murd'rous shame commits.",
    "X  For shame! deny that thou bear'st love to any,\n  Who for thy self art so unprovident.\n  Grant, if thou wilt, thou art belov'd of many,\n  But that thou none lov'st is most evident:\n  For thou art so possess'd with murderous hate,\n  That 'gainst thy self thou stick'st not to conspire,\n  Seeking that beauteous roof to ruinate\n  Which to repair should be thy chief desire.\n  O! change thy thought, that I may change my mind:\n  Shall hate be fairer lodg'd than gentle love?\n  Be, as thy presence is, gracious and kind,\n  Or to thyself at least kind-hearted prove:\n    Make thee another self for love of me,\n    That beauty still may live in thine or thee."]
    for i in (0...bodies.length)
      sonnets.push({
        'author' => 'W Shakespeare',
        'title' => titles[i],
        'body' => bodies[i],
        'tags' => tags[i]
        })
    end
    return sonnets
  end

sonnets = load_sonnets2()

for sonnet in sonnets do
    author = sonnet['author']
    title = sonnet['title']
    body = sonnet['body']
    tags = sonnet['tags']
    add_post(title,author,body,tags)
end
