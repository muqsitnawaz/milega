module ProductsHelper
  def get_sizes
    ["S", "M", "L", "XL"]
  end

  def get_sizes_list(product)
    str = ""

    if (product.psize_xs == true)
      str += "XS, "
    end

    if (product.psize_s == true)
      str += "S, "
    end

    if (product.psize_m == true)
      str += "M, "
    end

    if (product.psize_l == true)
      str += "L, "
    end

    if (product.psize_xl == true)
      str += "XL, "
    end

    return str.gsub(/,\s$/i,'')
  end

  def get_booleans
    [true, false]
  end

  def get_image_uploaders
    
  end
end
