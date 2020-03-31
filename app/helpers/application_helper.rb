module ApplicationHelper
  def adult_icon(resource)
    image_tag "adults.png", class: "icon", alt: "adultes" if resource.adults
  end

  def kid_icon(resource)
    image_tag "kids.png", class: "icon", alt: "enfants" if resource.kids
  end

  def learn_icon(resource)
    image_tag "learn.png", class: "icon", alt: "apprendre" if resource.learn
  end

  def fun_icon(resource)
    image_tag "fun.png", class: "icon", alt: "divertissement" if resource.fun
  end

  def watch_icon(resource)
    image_tag "watch.png", class: "icon", alt: "regarder" if resource.watch
  end

  def play_icon(resource)
    image_tag "play.png", class: "icon", alt: "jouer" if resource.play
  end

  def listen_icon(resource)
    image_tag "listen.png", class: "icon", alt: "écouter" if resource.listen
  end

  def read_icon(resource)
    image_tag "read.png", class: "icon", alt: "lire" if resource.read
  end

  def make_icon(resource)
    image_tag "make.png", class: "icon", alt: "fabriquer" if resource.make
  end

  def class_active(action)
    if params[:category]
      if params[:category].include?(action)
        "box active"
      else
        "box"
      end
    else
      "box"
    end
  end
end
