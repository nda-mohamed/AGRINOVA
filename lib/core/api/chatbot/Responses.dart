/// id : "gen-1780855249-b3UASqhxrCP0mJiooo54"
/// object : "chat.completion"
/// created : 1780855249
/// model : "google/gemma-4-26b-a4b-it-20260403:free"
/// provider : "Google AI Studio"
/// system_fingerprint : null
/// service_tier : "default"
/// choices : [{"index":0,"logprobs":null,"finish_reason":"stop","native_finish_reason":"STOP","message":{"role":"assistant","content":"Hello! How can I help you today?","refusal":null,"reasoning":null}}]
/// usage : {"prompt_tokens":3,"completion_tokens":9,"total_tokens":12,"cost":0,"is_byok":false,"prompt_tokens_details":{"cached_tokens":0,"cache_write_tokens":0,"audio_tokens":0,"video_tokens":0},"cost_details":{"upstream_inference_cost":0,"upstream_inference_prompt_cost":0,"upstream_inference_completions_cost":0},"completion_tokens_details":{"reasoning_tokens":0,"image_tokens":0,"audio_tokens":0}}

class Response {
  Response({
      this.id, 
      this.object, 
      this.created, 
      this.model, 
      this.provider, 
      this.systemFingerprint, 
      this.serviceTier, 
      this.choices, 
      this.usage,});

  Response.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    provider = json['provider'];
    systemFingerprint = json['system_fingerprint'];
    serviceTier = json['service_tier'];
    if (json['choices'] != null) {
      choices = [];
      json['choices'].forEach((v) {
        choices?.add(Choices.fromJson(v));
      });
    }
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }
  String? id;
  String? object;
  num? created;
  String? model;
  String? provider;
  dynamic systemFingerprint;
  String? serviceTier;
  List<Choices>? choices;
  Usage? usage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    map['created'] = created;
    map['model'] = model;
    map['provider'] = provider;
    map['system_fingerprint'] = systemFingerprint;
    map['service_tier'] = serviceTier;
    if (choices != null) {
      map['choices'] = choices?.map((v) => v.toJson()).toList();
    }
    if (usage != null) {
      map['usage'] = usage?.toJson();
    }
    return map;
  }

}

/// prompt_tokens : 3
/// completion_tokens : 9
/// total_tokens : 12
/// cost : 0
/// is_byok : false
/// prompt_tokens_details : {"cached_tokens":0,"cache_write_tokens":0,"audio_tokens":0,"video_tokens":0}
/// cost_details : {"upstream_inference_cost":0,"upstream_inference_prompt_cost":0,"upstream_inference_completions_cost":0}
/// completion_tokens_details : {"reasoning_tokens":0,"image_tokens":0,"audio_tokens":0}

class Usage {
  Usage({
      this.promptTokens, 
      this.completionTokens, 
      this.totalTokens, 
      this.cost, 
      this.isByok, 
      this.promptTokensDetails, 
      this.costDetails, 
      this.completionTokensDetails,});

  Usage.fromJson(dynamic json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
    cost = json['cost'];
    isByok = json['is_byok'];
    promptTokensDetails = json['prompt_tokens_details'] != null ? PromptTokensDetails.fromJson(json['prompt_tokens_details']) : null;
    costDetails = json['cost_details'] != null ? CostDetails.fromJson(json['cost_details']) : null;
    completionTokensDetails = json['completion_tokens_details'] != null ? CompletionTokensDetails.fromJson(json['completion_tokens_details']) : null;
  }
  num? promptTokens;
  num? completionTokens;
  num? totalTokens;
  num? cost;
  bool? isByok;
  PromptTokensDetails? promptTokensDetails;
  CostDetails? costDetails;
  CompletionTokensDetails? completionTokensDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prompt_tokens'] = promptTokens;
    map['completion_tokens'] = completionTokens;
    map['total_tokens'] = totalTokens;
    map['cost'] = cost;
    map['is_byok'] = isByok;
    if (promptTokensDetails != null) {
      map['prompt_tokens_details'] = promptTokensDetails?.toJson();
    }
    if (costDetails != null) {
      map['cost_details'] = costDetails?.toJson();
    }
    if (completionTokensDetails != null) {
      map['completion_tokens_details'] = completionTokensDetails?.toJson();
    }
    return map;
  }

}

/// reasoning_tokens : 0
/// image_tokens : 0
/// audio_tokens : 0

class CompletionTokensDetails {
  CompletionTokensDetails({
      this.reasoningTokens, 
      this.imageTokens, 
      this.audioTokens,});

  CompletionTokensDetails.fromJson(dynamic json) {
    reasoningTokens = json['reasoning_tokens'];
    imageTokens = json['image_tokens'];
    audioTokens = json['audio_tokens'];
  }
  num? reasoningTokens;
  num? imageTokens;
  num? audioTokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reasoning_tokens'] = reasoningTokens;
    map['image_tokens'] = imageTokens;
    map['audio_tokens'] = audioTokens;
    return map;
  }

}

/// upstream_inference_cost : 0
/// upstream_inference_prompt_cost : 0
/// upstream_inference_completions_cost : 0

class CostDetails {
  CostDetails({
      this.upstreamInferenceCost, 
      this.upstreamInferencePromptCost, 
      this.upstreamInferenceCompletionsCost,});

  CostDetails.fromJson(dynamic json) {
    upstreamInferenceCost = json['upstream_inference_cost'];
    upstreamInferencePromptCost = json['upstream_inference_prompt_cost'];
    upstreamInferenceCompletionsCost = json['upstream_inference_completions_cost'];
  }
  num? upstreamInferenceCost;
  num? upstreamInferencePromptCost;
  num? upstreamInferenceCompletionsCost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['upstream_inference_cost'] = upstreamInferenceCost;
    map['upstream_inference_prompt_cost'] = upstreamInferencePromptCost;
    map['upstream_inference_completions_cost'] = upstreamInferenceCompletionsCost;
    return map;
  }

}

/// cached_tokens : 0
/// cache_write_tokens : 0
/// audio_tokens : 0
/// video_tokens : 0

class PromptTokensDetails {
  PromptTokensDetails({
      this.cachedTokens, 
      this.cacheWriteTokens, 
      this.audioTokens, 
      this.videoTokens,});

  PromptTokensDetails.fromJson(dynamic json) {
    cachedTokens = json['cached_tokens'];
    cacheWriteTokens = json['cache_write_tokens'];
    audioTokens = json['audio_tokens'];
    videoTokens = json['video_tokens'];
  }
  num? cachedTokens;
  num? cacheWriteTokens;
  num? audioTokens;
  num? videoTokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cached_tokens'] = cachedTokens;
    map['cache_write_tokens'] = cacheWriteTokens;
    map['audio_tokens'] = audioTokens;
    map['video_tokens'] = videoTokens;
    return map;
  }

}

/// index : 0
/// logprobs : null
/// finish_reason : "stop"
/// native_finish_reason : "STOP"
/// message : {"role":"assistant","content":"Hello! How can I help you today?","refusal":null,"reasoning":null}

class Choices {
  Choices({
      this.index, 
      this.logprobs, 
      this.finishReason, 
      this.nativeFinishReason, 
      this.message,});

  Choices.fromJson(dynamic json) {
    index = json['index'];
    logprobs = json['logprobs'];
    finishReason = json['finish_reason'];
    nativeFinishReason = json['native_finish_reason'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  num? index;
  dynamic logprobs;
  String? finishReason;
  String? nativeFinishReason;
  Message? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = index;
    map['logprobs'] = logprobs;
    map['finish_reason'] = finishReason;
    map['native_finish_reason'] = nativeFinishReason;
    if (message != null) {
      map['message'] = message?.toJson();
    }
    return map;
  }

}

/// role : "assistant"
/// content : "Hello! How can I help you today?"
/// refusal : null
/// reasoning : null

class Message {
  Message({
      this.role, 
      this.content, 
      this.refusal, 
      this.reasoning,});

  Message.fromJson(dynamic json) {
    role = json['role'];
    content = json['content'];
    refusal = json['refusal'];
    reasoning = json['reasoning'];
  }
  String? role;
  String? content;
  dynamic refusal;
  dynamic reasoning;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['content'] = content;
    map['refusal'] = refusal;
    map['reasoning'] = reasoning;
    return map;
  }

}