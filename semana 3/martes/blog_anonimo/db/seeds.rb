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
  sonnet.create(
    author: author,
    title: title,
    body: body)
  for tag in tags do
    working_tag = Tag.find_by(name: tag)
    if !working_tag
      working_tag = tag.create(name: tag)
    end
    connection_dict = {
      'postname' => title,
      'tagname' => tag}
    connection = Connection.create(connection_dict)
  end
end
