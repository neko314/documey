module MembershipnumberHelper
  def membership_number(person)
    if person.membership_number.blank?
      t("not-registrated")
    else
      person.membership_number
    end
  end
end
