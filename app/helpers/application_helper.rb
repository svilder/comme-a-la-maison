module ApplicationHelper
  def adult_icon(resource)
    image_tag "adults.png", alt: "adultes" if resource.adults
  end

  def kid_icon(resource)
    image_tag "kids.png", alt: "enfants" if resource.kids
  end

  def learn_icon(resource)
    image_tag "learn.png", alt: "apprendre" if resource.learn
  end

  def fun_icon(resource)
    image_tag "fun.png", alt: "divertissement" if resource.fun
  end

  def watch_icon(resource)
    image_tag "watch.png", alt: "regarder" if resource.watch
  end

  def play_icon(resource)
    image_tag "play.png", alt: "jouer" if resource.play
  end

  def listen_icon(resource)
    image_tag "listen.png", alt: "écouter" if resource.listen
  end

  def read_icon(resource)
    image_tag "read.png", alt: "lire" if resource.read
  end

  def make_icon(resource)
    image_tag "make.png", alt: "fabriquer" if resource.make
  end
end
