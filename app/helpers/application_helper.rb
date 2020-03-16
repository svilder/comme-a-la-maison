module ApplicationHelper
  def public_icon(resource)
    if resource.public == "Adultes"
      image_tag "adults.png", alt: "adultes"
    elsif resource.public == "Enfants"
      image_tag "kids.png", alt: "enfants"
    end
  end

  def objectif_icon(resource)
    if resource.objectif == "Apprendre"
      image_tag "learn.png", alt: "apprendre"
    elsif resource.objectif == "Se divertir"
      image_tag "fun.png", alt: "divertissement"
    end
  end

  def activities_icon(resource)
    if resource.activity_type == "regarder"
      image_tag "watch.png", alt: "regarder"
    elsif resource.activity_type == "jouer"
      image_tag "play.png", alt: "jouer"
    elsif resource.activity_type == "écouter"
      image_tag "listen.png", alt: "écouter"
    elsif resource.activity_type == "lire"
      image_tag "read.png", alt: "lire"
    elsif resource.activity_type == "fabriquer"
      image_tag "make.png", alt: "fabriquer"
    end
  end
end
