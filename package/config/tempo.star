load("@ytt:assert", "assert")
load("@ytt:data", "data")

# ##########
# VALIDATION
# ##########

def validate_tempo():
  if data.values.tempo.tempoStack.enabled and data.values.tempo.tempoMonolithic.enabled:
    assert.fail("only one between tempoStack and tempoMonolithic can be enabled at the same time")
  end

  if data.values.tempo.tempoStack.enabled and data.values.tempo.storage.backend.type == "memory":
    assert.fail("the 'memory' storage type is not available for tempoStack")
  end
end

validate_tempo()
