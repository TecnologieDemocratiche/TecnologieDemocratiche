def expect_errors_on_model_field(model, field, count)
  model.valid?
  expect(model.errors[field].count).to eq count
end
