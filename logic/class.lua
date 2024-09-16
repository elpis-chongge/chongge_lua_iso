function class(classname, super)
  local superType = type(super)
  
  local cls
  if "function" ~= superType and "table" ~= superType then
    super = nil
    superType = nil
  end
  if "function" == superType or super and 1 == super.__ctype then
    cls = {}
    if "table" == superType then
      for k, v in pairs(super) do
        cls[k] = v
      end
      cls.__create = super.__create
      cls.super = super
    else
      cls.__create = super
    end
    
    function cls.ctor()
    end
    
    cls.__cname = classname
    cls.__ctype = 1
    
    function cls.new(...)
      local instance = cls.__create(...)
      for k, v in pairs(cls) do
        instance[k] = v
      end
      instance.class = cls
      instance:ctor(...)
      return instance
    end
  else
    if super then
      cls = clone(super)
      cls.super = super
    else
      cls = {
        ctor = function()
        end
      }
    end
    cls.__cname = classname
    cls.__ctype = 2
    cls.__index = cls
    
    function cls.new(...)
      local instance = setmetatable({}, cls)
      instance.class = cls
      instance:ctor(...)
      return instance
    end
  end
  return cls
end
