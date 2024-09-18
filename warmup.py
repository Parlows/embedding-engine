from transformers import CLIPModel, AutoProcessor

model_name = 'openai/clip-vit-large-patch14'
model = CLIPModel.from_pretrained(model_name)
processor = AutoProcessor.from_pretrained(model_name)

inputs = processor(text='test', return_tensors='pt')

image_features = model.get_text_features(**inputs)