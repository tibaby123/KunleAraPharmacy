import { useState } from 'react';

export default function ProductCard({ product }) {
  const [isAdding, setIsAdding] = useState(false);

  const addToCart = async () => {
    setIsAdding(true);
    // Add to cart logic here
    setTimeout(() => {
      setIsAdding(false);
      alert(Added  to cart!);
    }, 500);
  };

  return (
    <div className='bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow'>
      <div className='mb-4'>
        <div className='w-full h-32 bg-gray-200 rounded-lg mb-3 flex items-center justify-center'>
          <span className='text-gray-500'>📊</span>
        </div>
        <h3 className='font-bold text-lg text-gray-800'>{product.name}</h3>
        <p className='text-sm text-gray-600 mb-2'>{product.category}</p>
      </div>
      
      <div className='mb-4'>
        <span className='text-2xl font-bold text-green-600'>
          ₦{typeof product.price === 'number' ? product.price.toLocaleString() : product.price}
        </span>
        <p className='text-xs text-gray-500'>SKU: {product.sku}</p>
      </div>

      <div className='mb-4'>
        <span className={inline-block px-2 py-1 rounded-full text-xs }>
          {product.in_stock ? 'In Stock' : 'Out of Stock'}
        </span>
      </div>

      <button 
        onClick={addToCart}
        disabled={!product.in_stock || isAdding}
        className={w-full py-2 px-4 rounded font-semibold  transition-colors}
      >
        {isAdding ? 'Adding...' : 'Add to Cart'}
      </button>
    </div>
  );
}
